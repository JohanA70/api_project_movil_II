<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
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

        // Proyectos
        Route::apiResource('projects', ProjectController::class);
        Route::get('projects/search/by-name', [ProjectController::class, 'index']); // Búsqueda por nombre
        Route::get('projects/{project}/assigned-users', [ProjectController::class, 'assignedUsers']);

        // Tareas
        Route::apiResource('projects.tasks', TaskController::class)->shallow();
        Route::get('projects/{project}/tasks/search/by-name', [TaskController::class, 'search']);

        // Asignaciones
        Route::post('projects/{project}/assignments', [ProjectAssignmentController::class, 'store']);
        Route::delete('projects/{project}/assignments/{user}', [ProjectAssignmentController::class, 'destroy']);
    });
});
