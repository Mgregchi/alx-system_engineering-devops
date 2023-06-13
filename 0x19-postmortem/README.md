# 0x19-postmortem

## Concepts

For this project, we expect you to look at this concept:

- [On-call](./concept)


## Background Context 

Any software system will eventually fail, and that failure can come stem from a wide range of possible factors: bugs, traffic spikes, security issues, hardware failures, natural disasters, human error… Failing is normal and failing is actually a great opportunity to learn and improve. Any great Software Engineer must learn from his/her mistakes to make sure that they won’t happen again. Failing is fine, but failing twice because of the same issue is not.

A postmortem is a tool widely used in the tech industry. After any outage, the team(s) in charge of the system will write a summary that has 2 main goals:

To provide the rest of the company’s employees easy access to information detailing the cause of the outage. Often outages can have a huge impact on a company, so managers and executives have to understand what happened and how it will impact their work.

And to ensure that the root cause(s) of the outage has been discovered and that measures are taken to make sure it will be fixed.

## Resources

**Read or watch:**

- [Incident Report, also referred to as a Postmortem](https://sysadmincasts.com/episodes/20-how-to-write-an-incident-report-postmortem)

- [The importance of an incident postmortem process](https://www.atlassian.com/incident-management/postmortem)

- [What is an Incident Postmortem?](https://www.pagerduty.com/resources/learn/incident-postmortem/)

--------

## Postmortem

Service unavailability
Incident Report for LAMP stack powered Wordpress site was not loading
1. Issue Summary:
On March 3 at 14:45 UTC: Website is unresponsive with a returned response code status 500 when trying to access the site through the browser or CURL command with GET method to IP address. All users internal or external were unable to access the webpage, it was just not loading. At 17:35 UTC, found the root cause. 18:15 UTC, deployed automated fixed using Puppet.
2. Timeline
14:45 UTC: webpage found unresponsive after receiving email regarding this issue.
15:00 UTC: Verified with Chrome browser and CURL commands with GET requests.
The original assumption for root cause was the server down. Checked error.log, access.log, then restarted the server while checking logs again but found no related error codes.
Check server’s configuration files, history changes and found new uploaded PHP contents at 13:08 UTC same day.
15:50 UTC: successfully debugged by using strace command
16:15 UTC: deployed automated fix with Puppet scripty to fix spelling error. One of the PHP file’s extension was spelled “.phpp”.
16:30 UTC: Successfully fixed issue
3. Root cause and resolution:
New PHP files were uploaded 2 hours before the incident and WordPress configuration file was changed to include the new files. Server detected the error because it did not find the file listed in the config. Found resolution by using strace command with -p flag to track the child process(PID) of the Apache2 server when listening to requests while sending curl GET requests on a different terminal. strace returned -1 on missing PHP and HTML files. Determined fixed using a Docker container and deployed the automated fix using Puppet.
4. Corrective and preventative measures:
Going forward, please make sure to double check all filename spelling before deployment.
Test all servers are running properly on container first with no errors.
Send requests to the server to make sure the contents are returned with status code 200 and content is correct.
Hope this helps, thanks for reading.
