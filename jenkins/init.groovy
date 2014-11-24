import jenkins.model.*
import hudson.model.*
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
//Jenkins.instance.updateCenter.getPlugin("github").deploy(true)

def stheme=Jenkins.instance.getExtensionList(org.codefirst.SimpleThemeDecorator.class)[0]
stheme.cssUrl='/userContent/branding-style.css'
stheme.jsUrl=''
stheme.save()

// JDKs
if(!Jenkins.instance.getJDK('default')) {
  def oracleCredential=Jenkins.instance.getExtensionList(hudson.tools.JDKInstaller.DescriptorImpl.class)[0]
  oracleCredential.username = 'test'
  oracleCredential.password = new hudson.util.Secret('tutu')
  oracleCredential.save()

  def jdkinstsource = new hudson.tools.InstallSourceProperty([new hudson.tools.JDKInstaller('jdk-7u65-oth-JPR', true)])
  Jenkins.instance.getJDKs().add(new JDK("default",null,[jdkinstsource]))
  Jenkins.instance.save()
}

def myinstsource = new hudson.tools.InstallSourceProperty([new hudson.tasks.Maven.MavenInstaller('3.2.2')])
mavenconf=Jenkins.instance.getExtensionList(hudson.tasks.Maven.DescriptorImpl.class)[0];
mavenlist=(mavenconf.installations as List);
mavenlist.add(new hudson.tasks.Maven.MavenInstallation("default", null,[myinstsource]));
mavenconf.installations=mavenlist
mavenconf.save()


def admin_folder = Jenkins.instance.createProject(Folder.class, "Admin")
admin_folder.setDescription("Administrative's jobs");
admin_folder.createProjectFromXML("Seed", new FileInputStream("/tmp/seed.xml"))
admin_folder.createProjectFromXML("InstallJdk", new FileInputStream("/tmp/install_jdk.xml"))

//Jenkins.instance.restart()
