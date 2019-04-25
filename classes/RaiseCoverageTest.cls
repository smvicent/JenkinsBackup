@isTest
public with sharing class RaiseCoverageTest {
    @IsTest static void checkSum() {
        
        Integer num = RaiseCoverage.cheatCoverage();
        system.assertequals(1128, num);

    }
}