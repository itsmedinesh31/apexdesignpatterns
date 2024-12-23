//Interface
public Interface ISObjectCreation(){
    void createRecord();
}

//Factory class
public class AccountFactory implements ISObjectCreation{
    public static void createRecord(){
        System.debug('Logic for creating account record..');
    }
}
public class CustomObjectFactory implements ISObjectCreation{
    public static void createRecord(){
        System.debug('Logic for creating custom object record..');
    }
}

//Service class
public class RecordCreationFactoryService{
    public static ISObjectCreation createRecordFactory(String objectName) {
        if(objectName == 'Account'){
            return new AccountFactory();
        }
        else if(objectName == 'Any Custom object'){
            return new CustomObjectFactory();
        } else {
            return null;
        }
    }
}
//Main class
public class RecordGenerator{
    public static void createRecord(String objectName){
        ISObjectCreation recordGenerator = RecordCreationFactoryService.createRecordFactory(objectName);
        recordGenerator.createRecord();
    }
}
