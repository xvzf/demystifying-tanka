{  // self1
  person1: {  // self2

    params:: {  // : -> public, :: -> private
      name: 'Alice',
      age: 12,
    },

    welcome: 'Hello %(name)s, you are %(age)d years old' % self.params,  // self2
  },

  person2: self.person1 {
    params+:: {
      name: 'Bob',
    },
  },  // self1
}
