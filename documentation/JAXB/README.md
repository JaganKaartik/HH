# JAXB - Java Architecture for XML Binding


JAXB stands for Java Architecture for XML Binding. It provides a mechanism to write Java objects into XML and 
read XML as objects. Simply put, you can say it is used to convert Java objects into XML and vice-versa.

<p style="text-align: justify"> JAXB provides a fast and convenient way to bind XML schemas and Java representations, making it easy for Java developers to 
incorporate XML data and processing functions in Java applications. As part of this process, 
JAXB provides methods for unmarshalling (reading) XML instance documents into Java content, and then marshalling
(writing) Java content back into XML instance documents. JAXB also provides a way to generate XML schemas from Java objects.
</p>

## Marshalling: Converting Objects to XML

In this example, we need to convert Java objects to an XML document. First, we need to create a POJO class.

```java
import javax.xml.bind.annotation.*;

@XmlRootElement
public class Student {
    private String name;
    private int id;
    private String subject;
    Student(){
    }
    Student(String name,int id,String subject){
        this.name=name;
        this.id=id;
        this.subject=subject;
    }
    @XmlElement
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    @XmlAttribute
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    @XmlElement
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
}
```

In the above class:

***@XmlRootElement*** specifies the root element for the XML document.

***@XmlAttribute*** specifies the attribute for the root element.

***@XmlElement*** specifies the sub-element for the root element.

Marshaller Method

```java
try{
    //creating the JAXB context
    JAXBContext jContext = JAXBContext.newInstance(Student.class);
    //creating the marshaller object
    Marshaller marshallObj = jContext.createMarshaller();
    //setting the property to show xml format output
    marshallObj.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
    //setting the values in POJO class
    Student student = new Student(“abhishek”, 1163, “hadoop”);
    //calling the marshall method
    marshallObj.marshal(student, new FileOutputStream(“/home/knoldus/Desktop/student.xml”));
} catch(Exception e) {
    e.printStackTrace();
}
```

Un marshalling
```java
try{
    //getting the xml file to read
    File file = new File(“/home/knoldus/Desktop/student.xml”);
    //creating the JAXB context
    JAXBContext jContext = JAXBContext.newInstance(Student.class);
    //creating the unmarshall object
    Unmarshaller unmarshallerObj = jContext.createUnmarshaller();
    //calling the unmarshall method
    Student student=(Student) unmarshallerObj.unmarshal(file);
    System.out.println(student.getName()+” “+student.getId()+” “+student.getSubject());
}catch(Exception e){
    e.printStackTrace();
}
```
