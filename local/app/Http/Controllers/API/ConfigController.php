<?php

namespace App\Http\Controllers\API;

use App\Repositories\Backend\Config\ConfigRepositoryInterface;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ConfigController extends Controller
{
    protected $configRepository;

    public function __construct(ConfigRepositoryInterface $configRepository)
    {
        $this->configRepository = $configRepository;
    }

    public function getConfig()
    {

        return $this->configRepository->getAllConfig();

//        return view('backend.admin.config.index', compact('cauhinhs'));
    }

    public function saveConfig(Request $request)
    {
        $cauhinhs = $this->configRepository->updateAllConfig($request);
    }
}
