<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Dispatcher\ComponentDispatcherFactoryInterface;
use Joomla\CMS\Categories\CategoryFactoryInterface;
use Joomla\CMS\Extension\ComponentInterface;
use Joomla\CMS\Extension\Service\Provider\CategoryFactory;
use Joomla\CMS\Extension\MVCComponent;
use Joomla\CMS\Extension\Service\Provider\ComponentDispatcherFactory;
use Joomla\CMS\Extension\Service\Provider\MVCFactory;
use Joomla\CMS\Extension\Service\Provider\RouterFactory;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\CMS\Component\Router\RouterFactoryInterface;
use Joomla\CMS\HTML\Registry;
use Joomla\DI\Container;
use Joomla\DI\ServiceProviderInterface;
use TechFry\Component\TfMail\Administrator\Extension\TfMailComponent;

return new class implements ServiceProviderInterface
{
    public function register(Container $container): void 
    {
        $container->registerServiceProvider(new MVCFactory('\\TechFry\\Component\\TfMail'));
        $container->registerServiceProvider(new ComponentDispatcherFactory('\\TechFry\\Component\\TfMail'));
        $container->registerServiceProvider(new CategoryFactory('\\TechFry\\Component\\TfMail'));
        $container->registerServiceProvider(new RouterFactory('\\TechFry\\Component\\TfMail'));
        
        $container->set(
            ComponentInterface::class,
            function (Container $container) 
            {
                $component = new TfMailComponent($container->get(ComponentDispatcherFactoryInterface::class));
                
                $component->setMVCFactory($container->get(MVCFactoryInterface::class));
                $component->setCategoryFactory($container->get(CategoryFactoryInterface::class));
                $component->setRouterFactory($container->get(RouterFactoryInterface::class));

                return $component;
            }
        );
    }
};