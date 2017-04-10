using Hello_World;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloWorld
{
    class Hello
    {
        static void Main()
        {
            Console.WriteLine("Hello World!");
            chooseMenu();
            // Keep the console window open in debug mode.
            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }

        public static void chooseMenu()
        {
            Console.WriteLine("input 1 for demo exit or 2 for calculate: ");
            string menu = Console.ReadLine();
            if(menu == "1")
            {
                DemoExit();
            }
            else
            {
                var instance = new DemoVariable();
                instance.DemoVariableMain();
            }
        }

        private static void DemoExit()
        {
            int n;
            Console.Write("Masukkan nilai n: ");
            string s = Console.ReadLine();
            
            // Blok kode untuk proses pemilihan statemen
            if (!int.TryParse(s, out n))
            {
                Console.WriteLine("ERROR: n harus berupa " +
                                  "bilangan bulat");
                DemoExit();
            } // Akhir blok pemilihan

            // Blok kode untuk proses pemilihan statemen
            if (n < 0)
            {
                Console.WriteLine("ERROR: n tidak boleh negatif");
                DemoExit();
            } // Akhir blok pemilihan

            // Blok kode untuk proses pengulangan statemen
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine(i);
            } // Akhir blok pengulangan
        }
    }
    
}
