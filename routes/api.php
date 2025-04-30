<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\ProjectAssignmentController;

// Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::middleware('api')->group(function () {
    Route::post('/register', [RegisteredUserController::class, 'store']);
    Route::post('/login', [AuthenticatedSessionController::class, 'store']);

    Route::middleware('auth:sanctum')->group(function () {
        Route::post('/logout', [AuthenticatedSessionController::class, 'destroy']);
        Route::get('/user', function (Request $request) {
            return $request->user();
        });
        Route::get('/users', action: [UserController::class, 'index']); // Listar usuarios


        // Proyectos
        Route::apiResource('projects', ProjectController::class);
        Route::post('projects/search/by-name', [ProjectController::class, 'searchByName']); // Búsqueda por nombre
        Route::get('projects/{project}/assigned-users', [ProjectController::class, 'assignedUsers']);
        Route::put('projects/{project}', [ProjectController::class, 'update']);
        Route::get('projects/{project}', [ProjectController::class, 'searchById']);
        Route::get('/projects/participating/{id}', [ProjectController::class, 'projectsUserParticipates']);

        // Tareas
        Route::apiResource('projects.tasks', TaskController::class)->shallow();
        Route::get('projects/{project}/tasks/search/by-name', [TaskController::class, 'search']);
        Route::get('/tasks/user/{id}', [TaskController::class, 'tasksByUser']);
        Route::get('/tasks/{id}', [TaskController::class, 'show']);
        Route::get(uri: 'projects/{project}/tasks', action: [TaskController::class, 'index']);
        Route::patch(uri: '/tasks/{id}/update-status', action: [TaskController::class, 'updateStatus']);
        Route::post(uri: 'projects/{project}/tasks', action: [TaskController::class, 'store']);
        

        // Asignaciones
        Route::post('projects/{project}/assignments', [ProjectAssignmentController::class, 'store']);
        Route::delete('projects/{project}/assignments/{user}', [ProjectAssignmentController::class, 'destroy']);
    });
});
