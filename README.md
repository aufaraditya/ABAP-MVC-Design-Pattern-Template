# Basic Implementation of MVC Design Pattern in ABAP

## Brief Description
MVC is to isolate the business logic from the User Interface which gives great degree of flexibility to change business logic independently to the user interface and vice versa.

Generally, Model sends the data to controller and controller will pass that data to Views and views will display the data as per their nature. In SAP, our business logic(model) will not send data unless and until View request for an data because ABAP is event driven language. Like user has to run some transaction to get the data, means application view has to initiate the process and ask for the data from the Model. In this requesting process, Controller will help the view to be apart from the model.

## Summary
Model – Model represents an object which deals with business logic.
View – View represents the visualization of the data that model contains.
Controller – Controller acts on both model and view. It controls the data flow into model object and updates the view whenever data changes. It keeps view and model separate.

## Implementation

![Implementation Illustration in UML](http://4.bp.blogspot.com/_Pj9z40ys5GI/SPP_cbUJmJI/AAAAAAAAAk8/y_pieJt4-TI/s1600/MVC_example.jpg)


Source: http://zevolving.com/2008/10/abap-objects-design-patterns-model-view-controller-mvc-part-1/
