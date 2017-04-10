using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestPerson
{
    public struct Person
    {
        public string Name { get; set; }
        public int Age { get; set; }

        public Person(string name, int age)
        {
            Name = name;
            Age = age;
        }

    }

    public class Lalala
    {
        public Lalala(int length)
        {
            var phrase = "lalalalalalalalalalalalalalalalalalalalalalalalalalalalalala";
            var manyPhrases = new StringBuilder();
            for (var i = 0; i < length; i++)
            {
                manyPhrases.Append(phrase);
            }
            Console.WriteLine("tra" + manyPhrases);

            var syllable = "ha";
            var laugh = "";
            for (var i = 0; i < 10; i++)
            {
                laugh += syllable;
                foreach (var ch in laugh)
                {
                    if (ch == 'h')
                        Console.Write("H");
                    else
                        Console.Write(ch);
                }
                Console.WriteLine();
            }
        }
    }



    class ProgramPerson
    {
        static void Main()
        {
            //no parameter
            Person p1 = new Person("Lee Min Ho", 28);
            Console.WriteLine("person1 Name = {0} Age = {1}", p1.Name, p1.Age);

            //using parameter
            Person p2 = p1;

            p2.Name = "Kim Woo Bin";
            p2.Age = 27;

            Console.WriteLine("person2 Name = {0} Age = {1}", p2.Name, p2.Age);
            Console.WriteLine("person1 Name = {0} Age = {1}", p1.Name, p1.Age);

            if (p2.Equals(p1))
            {
                Console.WriteLine("person2 and person1 have same values.");
            }

            Lalala l = new Lalala(10);


            //keep the console window open in debug mode
            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
