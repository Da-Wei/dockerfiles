import jenkins.model.*
import hudson.security.LDAPSecurityRealm;

/*
Thread.start {
  sleep 10000
  println "--> setting agent port for jnlp"
  Jenkins.instance.setSlaveAgentPort(50000)
}
*/
Jenkins.instance.setSecurityRealm(
  new hudson.security.LDAPSecurityRealm(
    'ldap',
    '',
    'ou=People, dc=icdc, dc=local',
    '',
    'ou=Group,dc=icdc,dc=local',
    'cn=admin,dc=icdc,dc=local',
    'admin',
    false,
    false
  )
)
Jenkins.instance.save()

//def originalurl = 'http://updates.jenkins-ci.org/download/'
//def mirroredurl = 'http://jenkins.mirror.isppower.de/' // change to whatever works for you
def ucUrl = new URL('http://updates.jenkins-ci.org/update-center.json')

// loadJSON is not considered public API
//def json = hudson.model.DownloadService.loadJSON(ucUrl).replace(originalurl, mirroredurl)
def json = hudson.model.DownloadService.loadJSON(ucUrl)
def site = Jenkins.instance.updateCenter.getById('default')

// updateData is not public API either; false means don't verify the signature
def result = site.updateData(json, false) 

//Jenkins.instance.updateCenter.updateAllSites()
Jenkins.instance.updateCenter.getPlugin("cloudbees-folder").deploy(true)
Jenkins.instance.updateCenter.getPlugin("job-dsl").deploy(true)
Jenkins.instance.updateCenter.getPlugin("github").deploy(true)
Jenkins.instance.updateCenter.getPlugin("docker-plugin").deploy(true)
Jenkins.instance.updateCenter.getPlugin("docker-build-step").deploy(true)
Jenkins.instance.updateCenter.getPlugin("bazaar").deploy(true)
Jenkins.instance.updateCenter.getPlugin("git").deploy(true)
Jenkins.instance.updateCenter.getPlugin("groovy").deploy(true)
