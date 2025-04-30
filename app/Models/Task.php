<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Task extends Model
{
    use HasFactory;

    protected $fillable = ['project_id', 'user_id', 'name', 'description', 'status'];

    protected $casts = [
        'status' => 'string'
    ];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    // 🔗 Relación con el usuario asignado
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // 🔍 Función para obtener todas las tareas de un usuario
    public static function getTasksByUserId($userId)
    {
        return self::where('user_id', $userId)->get();
    }
}