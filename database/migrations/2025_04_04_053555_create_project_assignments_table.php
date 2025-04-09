<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('project_assignments', function (Blueprint $table) {
            $table->id(); // AUTO_INCREMENT PRIMARY KEY
            $table->foreignId('project_id')->constrained('projects')->onDelete('cascade');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade'); // Laravel ya tiene users
            $table->timestamp('assigned_at')->default(now());
            $table->timestamps();

            $table->unique(['project_id', 'user_id']); // Evita duplicados
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('project_assignments');
    }
};
