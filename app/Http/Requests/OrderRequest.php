<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'address' => 'required|string|max:225',
            'cityId'   => 'required|integer|exists:cities,id',
        ];
    }
    public function messages()
    {
        return [
            'address.required' => 'Address is required.',
            'cityId.required' => 'You need to choose town.',
        ];
    }
}
