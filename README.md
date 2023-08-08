# TaskTracker App

TaskTracker is a Flutter app that utilizes a REST API to provide users with task tracking functionalities. The app allows users to create an account, log in, edit their profile, recover a forgotten password using email and OTP verification, and features a clean and intuitive UI for managing task states such as new progress, canceled and completed.

## Features

- User Account Management: Create an account and log in.
- Profile Editing: Edit user profile information.
- Password Recovery: Reset password using email and OTP verification.
- Task State Tracking: Manage tasks with progress, canceled, completed, and new states.
- Task Status Modification: Ability to change the status of  tasks using the edit icon.
- Task Deletion: Users can delete tasks when they are no longer relevant or needed.
- Reusable Components: Built with a focus on reusable components for maintaining clean code.
- Clean Architecture: Designed to follow a clean architecture pattern.
- Validation: Implemented necessary input validation for enhanced data integrity.

## ScreenShots

<img src="https://github.com/musfique113/TaskTracker/assets/53111065/cc1e773b-57ae-46c2-a68c-545b59900c4c.png" alt="1_log_in_screen" height="500" width="220">
<img src="https://github.com/musfique113/TaskTracker/assets/53111065/7f0a4e12-3e39-46ee-b8fb-7b87f1e40261.png" alt="2_sign_up_screen" height="500" width="220">
<img src="https://github.com/musfique113/TaskTracker/assets/53111065/8696ddcd-8110-498b-b2fb-b69c0498ffe9.png" alt="3_email_verification_screen" height="500" width="220">
<img src="https://github.com/musfique113/TaskTracker/assets/53111065/336767e3-823d-4194-a978-c576f35a91b4.png" alt="4_otp_verification_page" height="500" width="220">
<img src="https://github.com/musfique113/TaskTracker/assets/53111065/5ae37762-275b-40cb-ad79-d58e9625e65b.png" alt="5_set_new_pass_screen" height="500" width="220">
<img src="https://github.com/musfique113/TaskTracker/assets/53111065/4e5f6469-0e96-44e6-b62b-6e6198b761e2.png" alt="6_home_dashboard_screen" height="500" width="220">
<img src="https://github.com/musfique113/TaskTracker/assets/53111065/91d6816c-f050-4390-a151-d1f5b0ffafb2.png" alt="7_progress_task_screen" height="500" width="220">
<img src="https://github.com/musfique113/TaskTracker/assets/53111065/5982c7cc-893d-490a-9d43-6ee69f09d107.png" alt="8_cancelled_task_screen" height="500" width="220">
<img src="https://github.com/musfique113/TaskTracker/assets/53111065/cdd052dd-f3e0-45bf-87fe-3fdf8a30c24c.png" alt="9_complete_task_screen" height="500" width="220">
<img src="https://github.com/musfique113/TaskTracker/assets/53111065/9bb8fef0-776e-44ad-9d2e-88dd88c40dd2.png" alt="10_edit_profile_screen" height="500" width="220">


## Known Issues

- Some features are currently lacking and may be under development.
- Bugs may be present in certain parts of the app.

## API Documentation

The Task Manager REST API allows users to manage tasks, user profiles, and account recovery. It provides various endpoints for user registration, login, task creation, updating task status, listing tasks by status, deleting tasks, and managing account recovery through email verification and password reset. The API is designed with a combination of POST and GET requests, utilizing JSON payloads for data exchange.

## API Endpoints

| Endpoint | Description |
|---|---|
| POST /registration | Registers a new user with the provided information, including email, first name, last name, mobile number, password, and optional photo. |
| POST /login | Logs in a user with their email and password, providing an authentication token for subsequent requests. |
| POST /profileUpdate | Updates the user's profile information, such as the mobile number, with the provided token for authorization. |
| POST /createTask | Creates a new task with a title, description, and status, requiring an authentication token for authorization. |
| GET /updateTaskStatus/{taskId}/{status} | Updates the status of a task identified by its ID with the provided status, requiring an authentication token for authorization. |
| GET /listTaskByStatus/{status} | Retrieves a list of tasks filtered by the specified status, requiring an authentication token for authorization. |
| GET /deleteTask/{taskId} | Deletes a task identified by its ID, requiring an authentication token for authorization. |
| GET /taskStatusCount | Retrieves the count of tasks in different statuses, requiring an authentication token for authorization. |
| GET /RecoverVerifyEmail/{email} | Initiates the account recovery process by sending an email verification link to the provided email address. |
| GET /RecoverVerifyOTP/{email}/{otp} | Verifies the recovery OTP (One-Time Password) sent to the user's email during the account recovery process. |
| POST /RecoverResetPass | Resets the user's password during the account recovery process, requiring the email, OTP, and new password. |

## Variables

* BaseURL: The base URL for all API endpoints.
* token: An authentication token used for authorization in requests.

---

## Clone the repository:
```git clone https://github.com/your-username/TaskTracker.git```