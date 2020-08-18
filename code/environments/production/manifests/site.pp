node 'puppet-agent-ubuntu.example.com' {
	$adminemail = 'webmaster@example.com'
	$servername = 'puppet.example.com'
 
	include apache
	include apache::vhosts
}
 
node 'puppet-agent-centos.example.com' {
	$adminemail = 'webmaster@example.com'
 	$servername = 'puppet.example.com'
 
	include apache
	include apache::vhosts
}
