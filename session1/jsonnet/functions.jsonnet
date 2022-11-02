local person = (import 'person.libsonnet');

{

  personsParams:: [
    {
      name: 'Alice',
      age: 12,
    },
    {
      name: 'Bob',
      age: 12,
    },
    {
      assert self.age > 33,

      name: 'Judith',
      age: 32,
    },
    {
      name: 'Sam',
      age: 20,
    },
  ],

  /*
  welcomeStrings: [
    generatePerson(param)

    for param in $.personsParams
  ],
  */

  // std.map(func, arr)
  welcomeStrings: std.map(person.sayHello, $.personsParams),


}
