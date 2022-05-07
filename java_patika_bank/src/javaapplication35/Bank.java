import java.util.*;
import java.text.*;
interface SavingsAccount
{
	final double rate = 0.04,limit = 10000,limit1 = 200;
	void deposit(double n,Date d);
	void withdraw(double n,Date d);
}
class Customer implements SavingsAccount
{
	String username,password,name,address,phone;
	double balance;
	ArrayList<String> transactions;
	Customer(String username,String password,String name,String address,String phone,double balance,Date date)
	{
		this.username = username;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.balance = balance;
		transactions  =  new ArrayList<String>(5);
		addTransaction(String.format("İlk para yatırma - " +NumberFormat.getCurrencyInstance().format(balance)+" as on " + "%1$tD"+" at "+"%1$tT.",date));
	}
	void update(Date date)
	{
		if(balance>= 10000)
		{
			balance += rate*balance;
		}
		else
		{
			balance -= (int)(balance/100.0);
		}
		addTransaction(String.format("Hesap güncellendi- " +NumberFormat.getCurrencyInstance().format(balance)+" as on " + "%1$tD"+" at "+"%1$tT.",date));
	}
	@Override
	public void deposit(double amount,Date date)
	{
		balance += amount;
		addTransaction(String.format(NumberFormat.getCurrencyInstance().format(amount)+" hesabınıza yatırıldı. " +NumberFormat.getCurrencyInstance().format(balance)+" as on " + "%1$tD"+" at "+"%1$tT.",date));
	}
	@Override
	public void withdraw(double amount,Date date)
	{
		if(amount>(balance-200))
		{
			System.out.println("Yetersiz");
			return;
		}
		balance -= amount;
		addTransaction(String.format(NumberFormat.getCurrencyInstance().format(amount)+" hesabınızdan borçlandırılır. " +NumberFormat.getCurrencyInstance().format(balance)+" as on " + "%1$tD"+" at "+"%1$tT.",date));
	}
	private void addTransaction(String message)
	{
			transactions.add(0,message);
			if(transactions.size()>5)
			{
				transactions.remove(5);
				transactions.trimToSize();
			}
	}
}
class Bank
{
	Map<String,Customer> customerMap;
	Bank()
	{
		customerMap = new HashMap <String,Customer>();
	}
	public static void main(String []args)
	{
		Scanner sc  =  new Scanner(System.in);
		Customer customer;
		String username,password;double amount;
		Bank bank  =  new Bank();
		int choice;
	outer:	while(true)
		{
			System.out.println("\n-------------------");
			System.out.println("JAVA PATİKA DEV BANK");
			System.out.println("-------------------\n");
			System.out.println("1. Hesap Aç.");
			System.out.println("2. Giriş Yap.");
			System.out.println("3. Hesap Güncelle.");
			System.out.println("4. Çıkış Yap.");
			System.out.print("\nSeçim Yap : ");
			choice = sc.nextInt();
			sc.nextLine();
			switch(choice)
			{
				case 1:
					System.out.print("Ad : ");
					String name = sc.nextLine();
					System.out.print("Mail Adresi : ");
					String address = sc.nextLine();
					System.out.print("Telefon Numarası : ");
					String phone = sc.nextLine();
					System.out.print("Kullanıcı adı : ");
					username = sc.next();
					while(bank.customerMap.containsKey(username))
					{
						System.out.println("Kullanıcı adı zaten var. tekrar ayarla : ");
						username = sc.next();
					}
					System.out.print("Bir şifre belirleyin (en az 8 karakter; en az 1 rakam, 1 küçük harf, 1 büyük harf, 1 özel karakter[!@#$%^&*_]) :");
					password = sc.next();
			
					while(!password.matches((("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*_]).{8,}"))))
					{
						System.out.println("Geçersiz parola koşullara dikkat et :");
						password=sc.next();
					}
					System.out.print("İlk para yatırma işlemini girin : ");
					sc.nextLine();
					while(!sc.hasNextDouble())
					{
						System.out.println("Geçersiz miktar. Tekrar girin :");
						sc.nextLine();
					}
					amount=sc.nextDouble();
					sc.nextLine();
					customer = new Customer(username,password,name,address,phone,amount,new Date());
					bank.customerMap.put(username,customer);
					break;
				case 2:
					System.out.print("kullanıcı adı : ");
					username = sc.next();
					sc.nextLine();
					System.out.print("şifre : ");
					password = sc.next();
					sc.nextLine();
					if(bank.customerMap.containsKey(username))
					{
						customer = bank.customerMap.get(username);
						if(customer.password.equals(password))
						{
							while(true)
							{
								System.out.println("\n-------------------");
								System.out.println("H O Ş G E L D İ N İ Z");
								System.out.println("-------------------\n");
								System.out.println("1. Depozito.");
								System.out.println("2. Transfer.");
								System.out.println("3. Son 5 işlem.");
								System.out.println("4. Kullanıcı Bilgisi");
								System.out.println("5. Çıkış Yap.");
								System.out.print("\nSeçim Yap : ");
								choice = sc.nextInt();
								sc.nextLine();
								switch(choice)
								{
									case 1:
									       System.out.print("Miktarı girin : ");
									       while(!sc.hasNextDouble())
									       {
										       System.out.print("Geçersiz Miktar tekrar dene :");
										       sc.nextLine();
									       }
									       amount = sc.nextDouble();
									       sc.nextLine();
	                                                                       customer.deposit(amount,new Date());
									       break;
									case 2:
									       System.out.print("alacaklı kullanıcı adını girin : ");
									       username = sc.next();
									       sc.nextLine();
									       System.out.print("Miktarı Girin : ");
									       while(!sc.hasNextDouble())
									       {
										       System.out.print("Geçersiz Miktar tekrar dene :");
										       sc.nextLine();
									       }
									       amount = sc.nextDouble();
									       sc.nextLine();
									       if(amount > 300000)
									       {
										       System.out.println("Aktarım sınırı aşıldı. Banka müdürüyle iletişime geçin.");
										       break;
									       }
									       if(bank.customerMap.containsKey(username))
									       {
										       Customer payee = bank.customerMap.get(username);
										       payee.deposit(amount,new Date());
										       customer.withdraw(amount,new Date());
									       }
									       else
									       {
										       System.out.println("Kullanıcı adı mevcut değil.");
									       }
									       break;
									case 3:
									       for(String transactions : customer.transactions)
									       {
										       System.out.println(transactions);
									       }
									       break;
									case 4:
									       System.out.print("Hesap Sahibinin Adı: "+customer.name);
									       System.out.print("Hesap Sahibinin Mail Adresi : "+customer.address);
									       System.out.print("Hesap Sahibinin Telefon numarası : "+customer.phone);
									       break;
									case 5:
									       continue outer;
								        default:
									        System.out.println("Yanlış seçim !");
								}
							}
						}
						else
						{
							System.out.println("Yanlış kullanıcı adı / şifre.");
						}
					}
					else
					{
						System.out.println("Yanlış kullanıcı adı / şifre..");
					}
					break;
				case 3:
					System.out.print("Kullanıvı Adı : ");
					username = sc.next();
					if(bank.customerMap.containsKey(username))
					{
						bank.customerMap.get(username).update(new Date());
					}
					else
					{
						System.out.println("Kullanıcı adı mevcut değil.");
					}
					break;
				case 4:
					System.out.println("\nJava Patika Dev Bank'ı seçtiğiniz için teşekkür ederiz."); 
					System.exit(1);
					break;
				default:
					System.out.println("Yanlış seçim !");
			}
		}
	}
}