## Strings

### Concatenate Strings


#### StringBuilder.Append method
String object in .NET is immutable. What does that mean? It means every time you use one of the String class methods, no matter if you use the same variable or a new variable, a new string object is created in memory. That means, a memory space is allocated for that new string in your computer memory. The more string methods you use to manipulate strings, the more memory space will be allocated in memory. That means in a string manipulation heavy code, if strings are not used wisely, it could lead to some serious app performance issues. 

.NET provides the System.Text.StringBuilder class that can be used to modify strings without creating new string objects. *StringBuilder *is highly recommended* if you have more than **a few hundred string concatenation operations** in your code.* StringBuilder is **not** recommended for a few string concatenation operations. 

StringBuilder class is defined in the System.Text namespace. You must either import this namespace in your class or reference is direct in the object instantiation.

```
System.Text.StringBuilder builder = new System.Text.StringBuilder("Mahesh Chand");    
builder.Append(", ");    
builder.Append("Chris Love");    
builder.Append(", Praveen Kumar");
```
