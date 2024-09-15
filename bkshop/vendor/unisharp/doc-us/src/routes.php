<?php
if (env('ENABLE_DOC_US', false)) {
    Route::get('schema', function (Illuminate\Http\Request $request) {
        $schema = UniSharp\DocUs\Parser::getSchema();

        $supportedFormats = array_map(function ($path) {
            return head(explode('.', basename($path)));
        }, Illuminate\Support\Facades\File::files(__DIR__ . '/views'));

        if (!in_array($format = strtolower($request->format), $supportedFormats)) {
            $format = 'html';
        }

        return response()->view("schema::{$format}", compact('schema'))
            ->header('Content-Type', "text/{$format}");
    });
}
