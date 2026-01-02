<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f9f8;
    color: #0c4b33;
    margin: 0;
    padding: 0;
  }

  h1, h2 {
    background-color: #e0f7f1;
    padding: 15px;
    border-left: 6px solid #0c4b33;
    border-radius: 5px;
    margin: 20px auto;
    width: 80%;
    box-shadow: 0 3px 6px rgba(0,0,0,0.1);
    line-height: 1.5;
  }

  h1 {
    text-align: center;
    font-size: 28px;
    color: #085f45;
  }

  .container {
    max-width: 900px;
    margin: auto;
    padding-bottom: 30px;
  }
</style>

<div class="container">
  <h2>Hello !!</h2>
  <h2>Made changes as per the requirement to automate the build and deploy the application into Tomcat.</h2>
  <h2>Jenkins will build the code and automatically create a Docker container.</h2>
  <h2>Jenkins will build the code, generate a new WAR file, copy it into the Ansible server, create an image, and update it on DockerHub automatically.</h2>
  <h2>We are copying artifacts from Jenkins to the Ansible server, so in the "Send build artifacts over SSH" section, we must select the Ansible server — not the Docker host.</h2>

  <h2>📌 Complete Workflow</h2>
  <h2>
    <b>Jenkins Workflow (CI/CD):</b><br><br>
    1 → Code Checkout — Jenkins pulls the latest source code from GitHub.<br>
    2 → Build WAR using Maven — Jenkins runs <code>mvn clean package</code> to compile and generate the WAR file.<br>
    3 → Post-Build Actions — Jenkins uses the "Send build artifacts over SSH" plugin to trigger Ansible playbooks:<br>
       &nbsp;&nbsp;&nbsp;&nbsp;• <code>ansible-playbook /opt/docker-folder/catdotcom.yml</code><br>
       &nbsp;&nbsp;&nbsp;&nbsp;• <code>ansible-playbook /opt/docker-folder/deploy_catdotcom.yml</code>
  </h2>

  <h2>📌 On Ansible Server (catdotcom.yml):</h2>
  <h2>
    FROM tomcat:latest → Use official Tomcat base image.<br>
    RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps → Restore default Tomcat apps.<br>
    COPY ./*.war /usr/local/tomcat/webapps → Deploy WAR into Tomcat.
  </h2>

  <h2>✅ What Happens:</h2>
  <h2>
    • A new Docker image is built.<br>
    • WAR file is packaged inside.<br>
    • Container runs and Tomcat deploys the app automatically.
  </h2>

  <h2>🚀 Catdotcom-App CI Job Flow:</h2>
  <h2>
    • Developer commits code → Jenkins pulls latest code.<br>
    • Jenkins builds WAR → Sends it to Ansible server.<br>
    • Ansible builds Docker image → Pushes to Docker Hub.
  </h2>
  <br>
  <br>
  <h2>
   • Jenkins triggers CD job → Ansible runs Kubernetes deployment playbook.<br>
   • Playbook connects to Kubernetes master node → Applies updated Deployment & Service YAML.<br>
   • Kubernetes pulls latest Docker image from Docker Hub → Updates running pods using rolling update.<br>
   • Application is live with zero downtime. <br>
  </h2>

  <h2>🛠 Fixed permission issue ("not allowed to use Docker") by adding <code>ansadmin</code> to the Docker group.</h2>
  <h2>This project demonstrates the full CI/CD flow (completed on 08-08-2025).</h2>

  <h1>🎉 CI/CD Project Completed!!!</h1>
 <%-- <h1>First pipeline success is always exciting!</h1> --%>
  <h1>Thank you for connecting Rajesh - 06-06-2025 -now-- i need your need help!!! thanks</h1>
</div>

