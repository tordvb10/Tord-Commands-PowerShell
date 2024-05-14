You can run the command "Tord" as if it was a "git" command, you'll be creating your own powershell structed commands by following the step-by-step process below.

<ol>
  <li>
    Frist fork this project, you can adjust the naming yourself afterwards (If your name is not Tord ;) )<br/>
  </li>
  <li>
    Set up environment variables on you computer, it's what you'll call them, see for instance picture below.
    <ul>
      <li>
        Hit win-button, search for "Advanced settings".
      </li>
      <li>
        Select "Environment variables", and go to "system variables and select "New..."
      </li>
    </ul>
    <br/>
  </li>
  <li>
    If you open Windows PowerShell, and type '$PROFILE', it will display the folderpath Windows PowerShell run everytime it opens a new Powershell window. Normally that path does not exist by default, at least it did not for me. <br/>It can be create by command:
    <ul>
      <li>
        ```
        New-Item -Path $PROFILE -ItemType File -Force
        ```
      </li>
    </ul>
    And to open it:
    <ul>
      <li>
        ```
        notepad $PROFILE
        ```
      </li>
    </ul>
  </li>
</ol>
