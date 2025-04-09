<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Project;
use App\Models\ProjectAssignment;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;


class ProjectAssignmentController extends Controller
{
    use AuthorizesRequests;
    // Asignar usuario a proyecto
    public function store(Request $request, Project $project)
    {
        $this->authorize('update', $project);
        
        $request->validate([
            'user_id' => 'required|exists:users,id'
        ]);

        if ($project->users()->where('user_id', $request->user_id)->exists()) {
            return response()->json(['message' => 'User already assigned'], 400);
        }

        $project->users()->attach($request->user_id);
        return response()->json(['message' => 'User assigned successfully'], 201);
    }

    // Eliminar asignación de usuario
    public function destroy(Project $project, $userId)
    {
        $this->authorize('update', $project);
        
        if (!$project->users()->where('user_id', $userId)->exists()) {
            return response()->json(['message' => 'Assignment not found'], 404);
        }

        $project->users()->detach($userId);
        return response()->json(null, 204);
    }
}
