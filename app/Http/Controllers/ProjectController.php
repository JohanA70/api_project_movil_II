<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Project;
use Illuminate\Support\Facades\Auth;
use App\Models\Task;
use App\Models\ProjectAssignment;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class ProjectController extends Controller
{
    use AuthorizesRequests;
    // Obtener todos los proyectos del usuario autenticado
    public function index(Request $request)
    {
        $query = Auth::user()->projects()->with(['tasks', 'users']);
        
        if ($request->has('name')) {
            $query->where('name', 'like', '%'.$request->name.'%');
        }
        
        return response()->json($query->get());
    }

    // Crear un nuevo proyecto
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string'
        ]);

        $project = Project::create($request->all());
        $project->users()->attach(Auth::id());

        return response()->json($project, 201);
    }

    // Actualizar proyecto
    public function update(Request $request, Project $project)
    {
        $this->authorize('update', $project);
        
        $request->validate([
            'name' => 'sometimes|string|max:255',
            'description' => 'nullable|string'
        ]);

        $project->update($request->all());
        return response()->json($project);
    }

    // Método para eliminar todas las relaciones usuario-proyecto
    protected function deleteProjectAssignments($projectId)
    {
        ProjectAssignment::where('project_id', $projectId)->delete();
    }

    // Método para eliminar todas las tareas de un proyecto
    protected function deleteProjectTasks($projectId)
    {
        Task::where('project_id', $projectId)->delete();
    }

    // Método para eliminar un proyecto (actualizado)
    public function destroy(Project $project)
    {
        $this->authorize('delete', $project);
        
        DB::transaction(function () use ($project) {
            // Eliminar tareas primero
            $this->deleteProjectTasks($project->id);
            
            // Eliminar asignaciones
            $this->deleteProjectAssignments($project->id);
            
            // Finalmente eliminar el proyecto
            $project->delete();
        });

        return response()->json(null, 204);
    }

    // Obtener usuarios asignados a un proyecto
    public function assignedUsers(Project $project)
    {
        $this->authorize('view', $project);
        return response()->json($project->users);
    }

    // Método para buscar proyectos por nombre
    public function searchByName(Request $request)
    {
        $request->validate([
            'name' => 'required|string'
        ]);

        $projects = Auth::user()->projects()
            ->where('name', 'like', '%'.$request->name.'%')
            ->get();

        return response()->json($projects);
    }
}
