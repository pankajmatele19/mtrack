<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\Application;
use App\Models\CompanyTeamRole;
use App\Models\SuperadminTeamRole;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;

class ApplicationManagementController extends Controller
{
    public $settings = [
        'track_applications' => [
            "title" => "Track Applications",
            "value" => 1,
            "description" => "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Amet, cumque."
        ],
        'live_camera' => [
            "title" => "Live Camera",
            "value" => 0,
            "description" => "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Amet, cumque."
        ],
        'live_screen' => [
            "title" => "Live Screen",
            "value" => 0,
            "description" => "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Amet, cumque."
        ],
        'live_interval' => [
            "title" => "Live Interval",
            "value" => 2,
            "description" => "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Amet, cumque.",
            "interval" => "in seconds"
        ],
        'track_activities' => [
            "title" => "Track Activites",
            "value" => 1,
            "description" => "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Amet, cumque."
        ],
        'track_activities_interval' => [
            "title" => "Track Activites Interval",
            "value" => 10,
            "description" => "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Amet, cumque.",
            "interval" => "in seconds"
        ],
    ];
    public function applications(Request $request)
    {
        $user = auth()->user();
        $flag = $user->is_super_admin;
        $pageData['flag'] = $flag;
        $pageData['table_name'] = "applications";
        $company_id = $user->company_id;

        $applications = DB::table('company_applications_nonproductive as cappnp')
            ->join('master_applications_categories as mappc', 'cappnp.category_id', '=', 'mappc.id')
            ->join('companies', 'cappnp.company_id', '=', 'companies.id')
            ->select('cappnp.*', 'mappc.category_name', 'companies.company_name');

        if ($flag != 1) {
            $applications = $applications->where('cappnp.company_id', $company_id);
        }

        if ($request->ajax()) {
            if ($request->has('customParam') && $request->customParam == "applications_table") {
                // $columns=['cappnp.'];
                if ($request->has('search')) {
                    $name = $request->search;
                    if (isset($name['value'])) {
                        $name = $name['value'];
                        $applications = $applications->where(function ($query) use ($name) {
                            $query->where('companies.company_name', 'like', '%' . $name . '%');
                            // ->orWhere('jp.job_title', 'like', '%' . $name . '%');
                        });
                    }
                }

                // if ($request->has('order')) {
                //     $order = $request->input('order')[0];
                //     $orderByColumnIndex = intval($order['column']); // Get the column index
                //     $orderDirection = $order['dir'];

                //     $orderByColumnName = $columns[$orderByColumnIndex];
                //     $applications = $applications->orderBy($orderByColumnName, $orderDirection);
                // } else {
                $applications = $applications->orderBy('cappnp.id', 'desc');
                // }

                $total_applications = $applications->count();

                $limit = $request->input('length');
                $start = $request->input('start');

                $applications = $applications->offset($start)
                    ->limit($limit)
                    ->get();

                $data = [];
                foreach ($applications->where('active', 1) as $key => $val) {

                    $data[] = [
                        // 'interviews' => view('job_posts.schedule_interviews_table_columns.interviews_details', $column_data)->render(),
                        // 'candidates' => view('job_posts.schedule_interviews_table_columns.candidates_details', $column_data)->render(),
                        // 'rating' => view('job_posts.schedule_interviews_table_columns.overall_rating', $column_data)->render(),

                        'is_nonproductive' => view('applications.switch', compact('val'))->render(),
                        'app_name' => "<span>" . (isset($val->app_name) ? $val->app_name : '-') . "</span><br>",
                        'description' => "<span>" . (isset($val->description) ? $val->description : '-') . "</span><br>",
                        'company_name' => "<span>" . (isset($val->company_name) ? $val->company_name : '-') . "</span><br>",
                        'category_name' => "<span>" . (isset($val->category_name) ? $val->category_name : '-') . "</span><br>",
                        'action' => view('applications.actions', compact('val'))->render(),
                        // 'type' => '<span class="badge badge-' . ((isset($value->interview_type) && $value->interview_type == 0) ? "success" : "warning") . '">' . ((isset($value->interview_type) && $value->interview_type == 0) ? "In Office" : "Virtual") . '</span>',
                        // 'datetime' => formatting_date_time($user->organization_id, $value->interview_date_time, 1)['datetime'],
                        // 'action' => view('job_posts.schedule_interviews_table_columns.action_column', $column_data)->render()
                    ];
                }

                $jsonResponse = [
                    'draw' => intval($request->input('draw')),
                    'recordsTotal' => intval($total_applications),
                    'recordsFiltered' => intval($total_applications),
                    'data' => $data,
                ];

                return response()->json($jsonResponse);
            }
        }

        $applications = $applications->get();

        $pageData['applications'] = $applications;
        return view('applications.applications', $pageData);
    }

    public function updateStatus(Request $request)
    {
        $applicationId = $request->input('application_id');
        $status = $request->input('status');

        // Update the status in the database
        DB::table('company_applications_nonproductive')
            ->where('id', $applicationId)
            ->update(['status' => $status]);

        return;
    }

    public function add_edit_application(Request $request, $app_id = null)
    {
        $user = auth()->user();
        $flag = $user->is_super_admin;
        $pageData = [];
        $pageData['flag'] = $flag;
        $pageData['company_id'] = $user->company_id;

        // Check if the user is a super admin
        if ($flag) {
            $pageData['company_name'] = 'Select Company'; // Set a default value for super admins
            $companies = Company::where('active', 1)->get();
        } else {
            // Assuming you have a 'companies' table and a 'company_name' column
            $company = Company::find($user->company_id);
            $pageData['company_name'] = $company->company_name;
            $companies = collect([$company]); // Convert the single company to a collection for consistency
        }

        $pageData['edit_app_details'] = false;
        $pageData['onmodal'] = false;
        $pageData['companies'] = $companies;

        // Assuming you have an 'applications' table
        $applications = Application::select(
            'company_applications_nonproductive.*',
            'master_applications_categories.category_name',
            'companies.company_name'
        )
            ->join('master_applications_categories', 'company_applications_nonproductive.category_id', '=', 'master_applications_categories.id')
            ->join('companies', 'company_applications_nonproductive.company_id', '=', 'companies.id')
            ->when(!$flag, function ($query) use ($pageData) {
                // If not a super admin, restrict to the user's company
                $query->where('company_applications_nonproductive.company_id', $pageData['company_id']);
            })
            ->get();

        // Fetch categories for applications directly from the 'applications' table
        $categories = DB::table('master_applications_categories')
            ->select('id as category_id', 'category_name')
            ->distinct()
            ->get();

        $pageData['categories'] = $categories;

        if (!empty($app_id)) {
            $app_details = $applications->where('id', $app_id)->first();
            $pageData['category_id'] = $app_details->category_id;

            $pageData['app_details'] = $app_details;
            $pageData['edit_app_details'] = true;

            // Assuming you have corresponding fields in the 'applications' table
            // Adjust these fields based on your actual table structure
            $pageData['app_name'] = $app_details->app_name;
            $pageData['app_description'] = $app_details->app_description;
            // Add more fields as needed
        }

        if ($request->ajax()) {
            if ($request->has('page') && $request->page == "view_application") {
                $pageData['onmodal'] = true;
                $modal_content = view('applications.application_details_view', $pageData)->render();
                return $modal_content;
            } else {
                // Return the necessary data for the modal
                $pageData['onmodal'] = true;
                $modal_content = view('applications.add_edit_application_modal_content', $pageData)->render();
                return $modal_content;
            }
        }

        return view('applications.edit', $pageData);
    }

    public function post_add_edit_application(Request $request, $app_id = null)
    {
        // Validate the form data
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:255',
            'category_id' => 'required|exists:master_applications_categories,id',
            'company_id' => 'required|exists:companies,id', // Assuming 'companies' is your companies table
            // Add more validation rules for other fields as needed
        ]);

        // Assuming you have an 'applications' table
        $application = new Application();

        // If editing, retrieve the existing application
        if (!empty($app_id)) {
            $application = Application::find($app_id);
        }

        // Assign form data to the application model
        $application->app_name = $request->input('name');
        $application->description = $request->input('description');
        $application->category_id = $request->input('category_id');
        // Set the company_id from the authenticated user
        $application->company_id = $request->input('company_id');
        $application->status = 0;

        // Add more fields as needed

        // Save the application
        $application->save();
        // Redirect back or to a different page after successful form submission
        return redirect()->route('applications')->with('success', 'Application saved successfully!');
    }
    public function softDeleteCompanyApp(Request $request)
    {
        $applicationId = $request->input('application_id');

        // Update the active status in the database (soft delete)
        DB::table('company_applications_nonproductive')
            ->where('id', $applicationId)
            ->update(['active' => 0]);

        return response()->json(['message' => 'Record deleted successfully']);
    }
}
