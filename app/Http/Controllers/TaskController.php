<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Project;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class TaskController extends Controller
{
    use AuthorizesRequests;
    // Crear nueva tarea
    public function store(Request $request, Project $project)
    {
        $this->authorize('update', $project);
        
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'status' => 'sometimes|in:Pending,In Progress,Completed'
        ]);

        $task = $project->tasks()->create($request->all());
        return response()->json($task, 201);
    }

    // Actualizar tarea
    public function update(Request $request, Task $task)
    {
        $this->authorize('update', $task->project);
        
        $request->validate([
            'name' => 'sometimes|string|max:255',
            'description' => 'sometimes|string',
            'status' => 'sometimes|in:Pending,In Progress,Completed'
        ]);

        $task->update($request->all());
        return response()->json($task);
    }

    // Eliminar tarea
    public function destroy(Task $task)
    {
        $this->authorize('update', $task->project);
        $task->delete();
        return response()->json(null, 204);
    }

    // Buscar tareas por nombre
    public function search(Project $project, Request $request)
    {
        $this->authorize('view', $project);
        
        $request->validate(['name' => 'required|string']);
        
        $tasks = $project->tasks()
            ->where('name', 'like', '%'.$request->name.'%')
            ->get();
            
        return response()->json($tasks);
    }
}
