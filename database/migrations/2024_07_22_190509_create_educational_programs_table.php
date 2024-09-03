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
        Schema::disableForeignKeyConstraints();
        Schema::create('educational_programs', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('subject_id');
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('trainer_id');
            $table->text('description');
            $table->integer('price')->default(0);
            $table->time('start_time')->nullable();
            $table->time('end_time')->nullable();
            $table->date('start_date')->nullable();
            $table->date('end_date')->nullable();
            $table->integer('hours');
            $table->boolean('available')->default(true);
            $table->string('status');
            $table->softDeletes();
            $table->timestamps();
            $table->foreign('subject_id')->references('id')->on('subjects');
            $table->foreign('category_id')->references('id')->on('categories');
            $table->foreign('trainer_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('educational_programs');
    }
};
