Hi everyone, in this article, we will talk about **SOLID** principles.

## Introduction
The **SOLID** principles were introduced by Robert C. Martin (Uncle Bob). The intention of these principles is to help us write maintainable, flexible, and extensible code. and by applying these principles in our design we can also avoid code smells and refactor our code.

## SOLD Stands for: 
- **S** - Single-responsiblity Principle
- **O** - Open-closed Principle
- **L** - Liskov Substitution Principle
- **I** - Interface Segregation Principle
- **D** - Dependency Inversion Principle

Examples will be given in Ruby, but these principles can be applied to any OOP language.

## Single-responsibility Principle (SRP)
Single-responsibility Principle (SRP) states that **"A class should have only a single responsibility."**
let's simplify this definition together, What does **single responsibility** mean? simply it means that our class should only have one reason to change and will happen if our class only has one job. 

The concept behind (SRP) sounds simple and clear but to apply this principle in your design you have to spend some time since a class’s responsibility isn’t always clear.

The following example of code does not follow the SRP

![SRP Bad Example](https://dev-to-uploads.s3.amazonaws.com/i/c1czlim3oifyg67u0ex3.png)

FinancialReportMailer handles two tasks (generate_report!) and (send_report) as shown above, So why this class does not apply the SRP principle? let's answer this question by asking one more question, What is the main responsibility of this class? is it to generate the financial report or send it? So according to this principle, we should divide the FinancialReportMailer class into two classes.

Now let's refactor our class and apply SRP

![SRP Good Example](https://dev-to-uploads.s3.amazonaws.com/i/bs0tsg7f5xb8k0roj8g4.png)

After refactoring, we have two classes that each perform exactly one task. So if we wanted to expand the class responsible for report generation in the future, we could simply make the necessary changes without having to touch the FinancialReportMailer class.


## Open-closed Principle (OCP)
Open-closed Principle (OCP) states that **"Objects or entities should be open for extension but closed for modification"**
That means we need to design our classes to be extendable without modifying the class itself.

This principle is important to follow to design a system that is easy to modify and extend in the future

Now let's take an example that does not follow the OCP.

The Logger class formats and sends logs. But the OCP principle is not followed, since we will have to modify the logger every time we need to add additional senders or formatters:

![OCP Bad Example](https://dev-to-uploads.s3.amazonaws.com/i/ghp2wcjrquzpb2ii7h2j.png)

Now let's refactor this code

![OCP Good Example](https://dev-to-uploads.s3.amazonaws.com/i/4s0xgddsos0vbhudrwf2.png)

In the example above, we have segregated senders and formatters to separate classes and enabled the addition of new senders and formatters without having to modify the base code.


## Liskov Substitution Principle (LSP)
Liskov Substitution Principle (LSP) states that **"If S is a subtype of T, then objects of type T may be replaced with objects of type S"** 
It sounds confusing, but do not worry, we will simplify it together. Let's break down the definition into small manageable pieces, from the definition of the principle we know that we are going to be working with parent and child classes, this tells us that the principle revolves around the object-oriented inheritance. Also from the definition, it sounds like programs have to be able to allow for child classes to seamlessly replace parent classes, and to make this happen we should ensure that our parent and child classes cannot have requirements that would cause conflicts.

Now that we know what the LSP principle is getting at, let's look at an example that violates LSP.

![LSP Bad Example](https://dev-to-uploads.s3.amazonaws.com/i/a7xm0jw264g70if7xd16.png)

In the example above, we are implementing user statistics. There are two classes: a base class (UserStatistic) and its child class (AdminStatistic). The child class violates the LSP principle since it completely redefines the base class by returning a string with filtered data, whereas the base class returns an array of posts.

Now let's refactor this code

![LSP Good Example](https://dev-to-uploads.s3.amazonaws.com/i/oqkxk8tsfx82zkg37hq7.png)

To apply LSP, we can segregate the filtration logic and the statistics string generation logic into two methods: “posts“ and “formatted_posts“. Therefore, we refactored the method posts that filtrate user posts, so the method returns the same type of data as the base class.


## Interface Segregation Principle (ISP)
Interface Segregation Principle states that **"Clients should not be forced to depend upon interfaces that they don't use."**
More simply: Do not add additional functionality to an existing interface by adding new methods. we should get the interfaces segregated according to their purpose, so we avoid “fat” classes and code that’s hard to maintain. In our design, we should not force our classes to implement unneeded methods (Dummy implementation).

**"Several client-specific interfaces are better than one generalized interface."**

Now let's take an example that does not apply ISP.

![ISP Bad Example](https://dev-to-uploads.s3.amazonaws.com/i/gh1rdul9ramczy8sdq5l.png)

In the example above, we have a piece of code that represents a coffee vending machine interface. As you can see, the interface is used by two types of users: a Person and a Staff. Each uses only a few interface abilities, however. For example, the class Person uses only the following methods: “select_drink_type“, “select_portion“, “select_sugar_amount“, and “brew_coffee“. The ISP principle tells that one class should contain only the method it uses.

To refactor this code, we created two interfaces: a separate user interface and a separate staff interface. In the “CoffeeMachineUserInterface,” a user will be able to choose a drink type (method “select_drink_type“), choose a portion size (method “select_portion“), select the amount of sugar they would like added to the drink (method “select_sugar_amount“), and start brewing the coffee (method “brew_coffee“). A staff member, using the “CoffeeMachineSeviceInterface,” will be able to choose among the following operations: clean the machine (method “clean_coffee_machine“), fill sugar (method “fill_sugar_supply“), fill coffee beans (method “fill_coffee_beans“), and fill water supply (method “fill_water_supply“).

With this design segregated in two interfaces, we’ve avoided unused methods and now have two smaller interfaces with methods that perform specific tasks.

![ISP Good Example](https://dev-to-uploads.s3.amazonaws.com/i/qnn9n51wgxiz077u1zav.png)


## Dependency Inversion Principle (DIP) 
Dependency Inversion Principle states that **"High-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions."**

- **High-level modules** = **interfaces** and **abstract classes**
- **Low-level** = **concrete classes**


Uncle Bob claims that the DIP principle is simply the result of strictly following the LSP and OCP. According to Uncle Bob, the code that follows the LSP and OCP should also be extendable, and child classes should be easily replaceable by other instances of a base class without breaking the system. 


By using DIP we will be able to increase the reusability of higher-level modules by making them independent of lower-level modules.

In the code below, we have implemented logic for a printer (the Printer class has the method print which performs data output). 

The class Printer depends on classes PdfFormatter and HtmlFormatter instead of abstractions, which indicates the violation of the DIP principle since the classes PdfFormatter and HtmlFormatter may contain the logic that refers to other classes. Thus, we may impact all the related classes when modifying the class Printer.

![DIP Bad Example](https://dev-to-uploads.s3.amazonaws.com/i/23si537mb75so8yj5g9d.png)

Now let's refactor the code above and apply DIP. Implementation of low-level details (outputting formats like PDF and HTML) is done in separate classes (PDF Formatter and HTML Formatter).

![DIP Good Examole](https://dev-to-uploads.s3.amazonaws.com/i/91dj6pfbv1lm9lvcbibs.png)

In the code above, the printer ‒ a high-level object ‒ doesn’t depend directly on the implementation of low-level objects ‒ the PDF and HTML formatters. In addition, all modules depend on abstraction. Our high-level functionality is separated from all low-level details, so we’re able to easily change the low-level logic without system-wide implications.

## Conclusion
In this article, we discussed the 5 SOLID principles, the benefits of using these principles, and we tried to understand each principle and refactored some examples in each one of the principles.

I wish this article was helpful for you, and thanks for taking the time to read the whole article. 


