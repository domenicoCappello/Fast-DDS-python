// Copyright 2016 Proyectos y Sistemas de Mantenimiento SL (eProsima).
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/*!
 * @file TestTypes.i
 * This header file contains the SWIG interface of the described types in the IDL file.
 *
 * This file was generated by the tool gen.
 */

%module TestTypes

// SWIG helper modules
%include "typemaps.i"
%include "std_string.i"
%include "std_vector.i"
%include "std_array.i"
%include "std_map.i"

// Assignemt operators are ignored, as there is no such thing in Python.
// Trying to export them issues a warning
%ignore *::operator=;

// Definition of internal types

typedef char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long int64_t;

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long uint64_t;


// Macro declarations
// Any macro used on the Fast DDS header files will give an error if it is not redefined here
#define RTPS_DllAPI
#define eProsima_user_DllExport


%{
#include "TestTypes.h"
%}

////////////////////////////////////////////////////////
// Binding for class HelloWorld
////////////////////////////////////////////////////////

// Ignore overloaded methods that have no application on Python
// Otherwise they will issue a warning
%ignore HelloWorld::HelloWorld(HelloWorld&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Avoid a warning ignoring all but one
%ignore HelloWorld::index(uint32_t&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore HelloWorld::index();
%rename("%s") HelloWorld::index() const;

%ignore HelloWorld::message(std::string&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore HelloWorld::message();
%rename("%s") HelloWorld::message() const;


////////////////////////////////////////////////////////
// Binding for class KeyedHelloWorld
////////////////////////////////////////////////////////

// Ignore overloaded methods that have no application on Python
// Otherwise they will issue a warning
%ignore KeyedHelloWorld::KeyedHelloWorld(KeyedHelloWorld&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Avoid a warning ignoring all but one
%ignore KeyedHelloWorld::key(uint16_t&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore KeyedHelloWorld::key();
%rename("%s") KeyedHelloWorld::key() const;

%ignore KeyedHelloWorld::index(uint32_t&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore KeyedHelloWorld::index();
%rename("%s") KeyedHelloWorld::index() const;

%ignore KeyedHelloWorld::message(std::string&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore KeyedHelloWorld::message();
%rename("%s") KeyedHelloWorld::message() const;


////////////////////////////////////////////////////////
// Binding for class FixedSize
////////////////////////////////////////////////////////

// Ignore overloaded methods that have no application on Python
// Otherwise they will issue a warning
%ignore FixedSize::FixedSize(FixedSize&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Avoid a warning ignoring all but one
%ignore FixedSize::index(uint16_t&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore FixedSize::index();
%rename("%s") FixedSize::index() const;


////////////////////////////////////////////////////////
// Binding for class Data64kb
////////////////////////////////////////////////////////

// Ignore overloaded methods that have no application on Python
// Otherwise they will issue a warning
%ignore Data64kb::Data64kb(Data64kb&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Avoid a warning ignoring all but one
%ignore Data64kb::data(std::vector<uint8_t>&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore Data64kb::data() const;
%template(uint8_t_vector) std::vector<uint8_t>;


////////////////////////////////////////////////////////
// Binding for class Data1mb
////////////////////////////////////////////////////////

// Ignore overloaded methods that have no application on Python
// Otherwise they will issue a warning
%ignore Data1mb::Data1mb(Data1mb&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Avoid a warning ignoring all but one
%ignore Data1mb::data(std::vector<uint8_t>&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore Data1mb::data() const;
%template(uint8_t_vector) std::vector<uint8_t>;


////////////////////////////////////////////////////////
// Binding for class KeyedData1mb
////////////////////////////////////////////////////////

// Ignore overloaded methods that have no application on Python
// Otherwise they will issue a warning
%ignore KeyedData1mb::KeyedData1mb(KeyedData1mb&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Avoid a warning ignoring all but one
%ignore KeyedData1mb::key(uint16_t&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore KeyedData1mb::key();
%rename("%s") KeyedData1mb::key() const;

%ignore KeyedData1mb::data(std::vector<uint8_t>&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore KeyedData1mb::data() const;
%template(uint8_t_vector) std::vector<uint8_t>;


////////////////////////////////////////////////////////
// Binding for class StringType
////////////////////////////////////////////////////////

// Ignore overloaded methods that have no application on Python
// Otherwise they will issue a warning
%ignore StringType::StringType(StringType&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Avoid a warning ignoring all but one
%ignore StringType::message(std::string&&);

// Overloaded getter methods shadow each other and are equivalent in python
// Const accesors produced constant enums instead of arrays/dictionaries when used
// We ignore them to prevent this
%ignore StringType::message();
%rename("%s") StringType::message() const;



// Include the class interfaces
%include "TestTypes.h"

// Include the corresponding TopicDataType
%include "TestTypesPubSubTypes.i"