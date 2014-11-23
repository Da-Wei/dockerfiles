import jenkins.model.*
import hudson.security.LDAPSecurityRealm
import hudson.security.GlobalMatrixAuthorizationStrategy
import com.cloudbees.hudson.plugins.folder.Folder

def env = System.getenv()

if(env['JENKINS_AUTH'] == 'ldap') {
  Jenkins.instance.setSecurityRealm(
    new hudson.security.LDAPSecurityRealm(
      'ldap',
      '',
      'ou=People, dc=test, dc=local',
      '',
      'ou=Group,dc=test,dc=local',
      'cn=admin,dc=test,dc=local',
      'admin',
      false,
      false
    )
  )
  def secustrategy = new GlobalMatrixAuthorizationStrategy()
  secustrategy.add("hudson.model.Hudson.Administer:Jenkins Admins")
  Jenkins.instance.setAuthorizationStrategy(secustrategy)
  Jenkins.instance.save()
}

def ucUrl = new URL('http://updates.jenkins-ci.org/update-center.json')

// loadJSON is not considered public API
def json = hudson.model.DownloadService.loadJSON(ucUrl)
def site = Jenkins.instance.updateCenter.getById('default')

// updateData is not public API either; false means don't verify the signature
def result = site.updateData(json, false) 

//Jenkins.instance.updateCenter.updateAllSites()
//Jenkins.instance.updateCenter.getPlugin("job-dsl").deploy(true)
Jenkins.instance.updateCenter.getPlugin("github").deploy(true)
Jenkins.instance.updateCenter.getPlugin("docker-plugin").deploy(true)
Jenkins.instance.updateCenter.getPlugin("docker-build-step").deploy(true)
Jenkins.instance.updateCenter.getPlugin("bazaar").deploy(true)
//Jenkins.instance.updateCenter.getPlugin("git").deploy(true)
Jenkins.instance.updateCenter.getPlugin("groovy").deploy(true)

//mavenconf=Jenkins.instance.getExtensionList(hudson.tasks.Maven.DescriptorImpl.class)[0];
//mavenlist=(mavenconf.installations as List);
//mavenlist.add(new hudson.tasks.Maven.MavenInstallation("MAVEN3", "/home/apache-maven-3", []));
//mavenconf.installations=mavenlist
//mavenconf.save()
new hudson.tasks.Maven.MavenInstaller('3.2.2')

def admin_folder = Jenkins.instance.createProject(Folder.class, "Admin")
admin_folder.setDescription("Administrative's jobs");
admin_folder.createProjectFromXML("Seed", new FileInputStream("/tmp/seed.xml"))
