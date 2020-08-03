
## PHPSTORM Database connection (avoid difference in timezone configuration)

```
jdbc:mysql://localhost:3306/{{DB_NAME}}?serverTimezone=UTC
```

## Factory Autocomplete (.phpstorm.meta.php)

```php
<?php
/*
 * Factory Autocomplete
 * @url https://intellij-support.jetbrains.com/hc/en-us/community/posts/360000344239-Factory-Autocomplete
 */
namespace PHPSTORM_META {
	$STATIC_METHOD_TYPES = [
		\SomeNameSpace\Core\Registry::get('') => [
			'filesystem'    instanceof \SomeNameSpace\Filesystem\Filesystem,
			'notice'        instanceof \SomeNameSpace\Core\NoticeHandler,
			'request'       instanceof \SomeNameSpace\Http\Request,
			'view'          instanceof \SomeNameSpace\View\View,
			'options'       instanceof \SomeNameSpace\Options\Options,
			'postOptions'   instanceof \SomeNameSpace\Options\PostOptions,
			'cache'         instanceof \SomeNameSpace\Cache\MemcacheCache,
		]
	];
}
```