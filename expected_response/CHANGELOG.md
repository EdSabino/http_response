## 1.0.0

- Create package
- Create the annotations
    - ExpectedResponse
        - Responsable for indicate the class where the ecossystem will run, is the entry point of everything;
    - Response
        - Identify the behaviour expected for each response code returned from the http response
    - Request
        - Identify the function that must make the request
    - EntryFunction
        - Is the function that will evoke the generated function
- Create ServerResponse, the abstract class that receives the http response
- Created the UnrecognizedHttpResponse, the default behaviour for unknown responses
- Created the HttpBase, the super class for every class annotated with @ExpectedResponse
- Documented the annotations
- Documented the helper classes 
- Create README
- Add LICENSE
### 1.0.0+1

- Change the description

### 1.0.0+2

- Change the changelog
