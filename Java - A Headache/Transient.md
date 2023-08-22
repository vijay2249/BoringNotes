
#Transient is a variables modifier used in [[Serialization]] 

At the time of #serialization, if we dont want to save values of particular variable in a file, then we use **transient** keyword.

When #JVM comes across **transient** keyword, it ignores original value of the variable and save default value of that variable data type.

**Transient** keyword plays an important role to meet security constraints. There are various real-life examples where we dont want to save private data in file.

Another use of **transient** keyword is not to serialize the variable whose value can be calculated/derived using other serialized objects or system such as age of a person etc..
