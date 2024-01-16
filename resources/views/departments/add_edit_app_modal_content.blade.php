<div class="card">
    <div class="card-header mx-auto pt-6">
        <h2>{{ isset($edit_app_details) && $edit_app_details == true ? 'Edit Department App' : 'Add New Department App' }}
        </h2>
    </div>
    <div class="card-body">
        <!--begin::Form-->
        <form id="add_edit_app_form" class="form"
            action="{{ isset($edit_app_details) && $edit_app_details == true ? url('/departments_app/edit') . '/' . (isset($app_details->id) ? $app_details->id : '') : url('/departments_app/add') }}"
            method="POST" enctype="multipart/form-data">
            @csrf
            <!--begin::Scroll-->
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="row">
                        @if ($flag == 1)
                            <div class="col-md-12 mb-7" id="myModal">
                                <select name="company_id" id="company_id" class="form-select bg-transparent">
                                    <option value="" selected disabled>Select Company</option>
                                    @foreach ($companies as $company)
                                        <option value="{{ $company->id }}"
                                            {{ isset($app_details) && $app_details->company_id == $company->id ? 'selected' : '' }}>
                                            {{ $company->company_name }}
                                        </option>
                                    @endforeach
                                </select>
                                <span class="field_errors" style="color: rgb(230, 33, 33)">
                                    @error('company_id')
                                        {{ $message }}
                                    @enderror
                                </span>
                            </div>
                        @endif
                        <!-- Application dropdown -->
                        <div class="fv-row mb-8" id="myModal">
                            <select name="app_id" id="app_id" class="form-select bg-transparent">
                                <option value="" selected disabled>Select Application</option>
                                {{-- Check if in edit mode --}}
                                @if (isset($edit_app_details) && $edit_app_details == true)
                                    @foreach ($applications as $application)
                                        @if (isset($app_details) && $app_details->company_id == $application->company_id)
                                            <option value="{{ $application->id }}"
                                                {{ isset($app_details) && $app_details->app_id == $application->id ? 'selected' : '' }}>
                                                {{ $application->app_name }}
                                            </option>
                                        @endif
                                    @endforeach
                                @else
                                    {{-- Options will be dynamically populated via JavaScript --}}
                                @endif
                            </select>
                            <!-- Add error message display if needed -->
                        </div>
                        <!-- Department dropdown -->
                        <div class="fv-row mb-8" id="myModal">
                            <select name="department_id" id="department_id" class="form-select bg-transparent">
                                <option value="" selected disabled>Select Department</option>
                                {{-- Check if in edit mode --}}
                                @if (isset($edit_app_details) && $edit_app_details == true)
                                    @foreach ($departments as $department)
                                        <option value="{{ $department->id }}"
                                            {{ isset($app_details) && $app_details->department_id == $department->id ? 'selected' : '' }}>
                                            {{ $department->department_name }}
                                        </option>
                                    @endforeach
                                @else
                                    {{-- Options will be dynamically populated via JavaScript --}}
                                @endif
                            </select>
                            <!-- Add error message display if needed -->
                        </div>
                        <!-- Status dropdown -->
                        <div class="fv-row mb-8" id="myModal">
                            <select name="status" id="status" class="form-select bg-transparent">
                                <option value="" selected disabled>Select Status</option>
                                <option value="1"
                                    {{ isset($app_details) && $app_details->status == 1 ? 'selected' : '' }}>
                                    Non-Productive
                                </option>
                                <option value="0"
                                    {{ isset($app_details) && $app_details->status == 0 ? 'selected' : '' }}>Productive
                                </option>
                            </select>
                            <!-- Add error message display if needed -->
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
            <!--begin::Actions-->
            <div class="text-center pt-10">
                <a href="{{ url('/applications') }}" class="btn btn-light me-3">Discard</a>
                <button type="submit" class="btn btn-primary">
                    <span
                        class="indicator-label">{{ isset($edit_app_details) && $edit_app_details == true ? 'Update' : 'Save' }}</span>
                    <span class="indicator-progress">Please wait...
                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                </button>
            </div>
            <!--end::Actions-->
        </form>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#category_id').select2({
            dropdownParent: $('#myModal'),
            width: "100%"
        });

        $('#app_id').select2({
            dropdownParent: $('#myModal'),
            width: "100%"
        });

        $('#department_id').select2({
            dropdownParent: $('#myModal'),
            width: "100%"
        });

        $('#status').select2({
            dropdownParent: $('#myModal'),
            width: "100%"
        });
        $('#company_id').select2({
            dropdownParent: $('#myModal'),
            width: "100%"
        });
    });
</script>
<script>
    $(document).ready(function() {
        // Check if the company dropdown is present
        if ($('#company_id').is(":visible")) {
            // If super admin, use the selected company from the dropdown
            $('#company_id').on('change', function() {
                var companyId = $(this).val();
                fetchEmployeesAndApplications(companyId);
            });
        } else {
            // If normal user, use the user's company ID directly
            fetchEmployeesAndApplications('{{ $userCompanyId }}');
        }

        function fetchEmployeesAndApplications(companyId) {
            $.ajax({
                type: 'GET',
                url: '/departments_app/get-company-data/' + companyId,
                success: function(data) {
                    // Update the applications dropdown
                    var appsDropdown = $('#app_id');
                    appsDropdown.empty();
                    appsDropdown.append(
                        '<option value="" selected disabled>Select Application</option>'
                    );
                    $.each(data.applications, function(id, app) {
                        appsDropdown.append('<option value="' + app.id + '">' + app
                            .app_name + '</option>');
                    });

                    // Update the departments dropdown
                    var departmentsDropdown = $('#department_id');
                    departmentsDropdown.empty();
                    departmentsDropdown.append(
                        '<option value="" selected disabled>Select Department</option>');
                    $.each(data.departments, function(id, department) {
                        departmentsDropdown.append('<option value="' + department
                            .id + '">' + department.department_name +
                            '</option>');
                    });
                }
            });
        }
    });
</script>
