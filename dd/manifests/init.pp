class dd (	$pattern,
		$dirpath = '/var/lib/jenkins/workspace' )
{
	tidy { 'jenkins cleanup':
		path => $dirpath,
		rmdirs => true,
		recurse => true,
		matches => $pattern,
	}
}
