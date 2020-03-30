#For Package Testing
sfdx force:org:create -f config/project-scratch-def.json  -d 30 -a IssueBoxScratchOrgPkg
#sfdx force:org:create -f config/project-scratch-def.json  -d 30 -a IssueBoxScratchOrgPkg -s -v LabsDevHub

sfdx force:package:install -p "Issue Box@0.1.0-3" -u IssueBoxScratchOrgPkg -k test1234 -w 10 -b 10

sfdx force:user:permset:assign -n  issuebox__IssueBox_Admin -u IssueBoxScratchOrgPkg

sfdx force:apex:execute -f config/create-demo-data.apex -u IssueBoxScratchOrgPkg

sfdx force:data:tree:import --plan data/issuebox-Issue__c-plan.json -u IssueBoxScratchOrgPkg

sfdx force:org:open -u IssueBoxScratchOrgPkg

#sfdx force:lightning:lwc:start 

#sfdx force:data:tree:export --query  "SELECT Details__c,Actual_Result__c,Email_Notification__c,Expected_Result__c,Priority__c,Reported_Object__c,Reported_Record__c, Repro_Steps__c,Status__c,Type__c from Issue__c " --prefix issuebox --outputdir data --plan

#Create package - ONE TIME - in Dev Hub
#sfdx force:package:create -n "Issue Box" -r force-app  -t Managed -v LabsDevHub

#Create package - Version - in Dev Hub
#sfdx force:package:version:create -p "Issue Box" -k test1234 --wait 10 -v LabsDevHub

#INSTALL - in pkg test scratch org
#sfdx force:package:install -p "Issue Box@0.1.0-1" -u IssueBoxScratchOrgPkg -k test1234 -w 10 -b 10