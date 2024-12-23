/** 
 * This class is used to query all existing accounts and utility
methods 
 * to return Account record on basis of industry and type 
 * */
public class AccountSingletonDemo {
  private List < Account > accList;
  private Map < String, Account > accountMap;
  private static AccountSingletonDemo selfInstance = null;
  public static AccountSingletonDemo getInstance() {
    if (selfInstance == null)
      selfInstance = new AccountSingletonDemo();
    return selfInstance;
  }

  private AccountSingletonDemo() {
    accList = [Select
      Name,Industry,Type
      FROM
      Account
      LIMIT 1000
    ];

    accountMap = new Map < String, Account > ();

    for (Account acc: accList) {
      accountMap.put(acc.Industry + '-' + acc.Type, acc);
    }

  }

  // Get "Account" on basis of Industry and type 
  public Account getIndustryType(String industry, String type) {
    return accountMap.get(industry + '-' + type);
  }