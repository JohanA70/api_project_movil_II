<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Project extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'description'];

    public function tasks(): HasMany
    {
        return $this->hasMany(Task::class);
    }

    public function assignments(): HasMany
    {
        return $this->hasMany(ProjectAssignment::class);
    }

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'project_assignments', 'project_id', 'user_id');
    }
}
