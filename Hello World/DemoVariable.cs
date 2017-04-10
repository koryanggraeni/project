using HelloWorld;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hello_World
{
    class DemoVariable
    {
        public void DemoVariableMain()
        {
            HitungLuas();
        }

        private static void HitungLuas()
        {
            //deklarasi variable
            int panjang, lebar, luas;
            int[] param = InputParameter();

            panjang = param[0];
            lebar = param[1];

            hitungLuasPersergi(panjang, lebar, out luas);
            showResult(luas);
        }

        static int[] InputParameter()
        {
            Console.Write("Masukkan panjang: ");
            string p = Console.ReadLine();
            Console.Write("Masukkan lebar: ");
            string l = Console.ReadLine();

            int panjang = Int32.Parse(p);
            int lebar = Int32.Parse(l);

            int[] persegi = new int[5];
            persegi[0] = panjang;
            persegi[1] = lebar;

            return persegi;
        }

        private static void hitungLuasPersergi(int panjang, int lebar, out int result)
        {
            result = panjang * lebar;

            return;
        }

        private static void showResult(int result)
        {
            Console.WriteLine("Luas persegi panjang = " + result);
            Console.WriteLine("if you want to calulate again input 1 or 2 for back to main menu: ");
            string menu = Console.ReadLine();
            if (menu == "1")
            {
                HitungLuas();
            }
            else
            {
                var instance = new Hello();
                instance.chooseMenu();
            }
        }
    }
}
