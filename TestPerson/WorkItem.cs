using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestPerson
{
    public class WorkItem
    {
        private static int currentID;

        protected int ID { get; set; }
        protected string Title { get; set; }
        protected string Description { get; set; }
        protected TimeSpan JobLength { get; set; }

        public WorkItem()
        {
            ID = 0;
            Title = "Default title";
            Description = "Default description";
            JobLength = new TimeSpan();
        }

        public WorkItem(string title, string desc, TimeSpan jobleng)
        {
            this.ID = GetNextID();
            this.Title = title;
            this.Description = desc;
            this.JobLength = jobleng;
        }

        static WorkItem()
        {
            currentID = 0;
        }

        protected int GetNextID()
        {
            return ++currentID;
        }

        public void Update(string title, TimeSpan jobleng)
        {
            this.Title = title;
            this.JobLength = jobleng;
        }

        public override string ToString()
        {
            return String.Format("{0} - {1}", this.ID, this.Title);
        }
    }

    public class ChangeRequest : WorkItem
    {
        protected int originalItemID { get; set; }

        public ChangeRequest()
        {

        }

        public ChangeRequest(string title, string desc, TimeSpan jobleng, int originalID)
        {
            this.ID = GetNextID();
            this.Title = title;
            this.Description = desc;
            this.JobLength = jobleng;

            this.originalItemID = originalID;
        }
    }

    class ProgramWorkItem
    {
        static void Main()
        {
            WorkItem item = new WorkItem("Create bug ticket", "create all bugs ticket", new TimeSpan(1, 2, 3));
            ChangeRequest change = new ChangeRequest("change bug ticket", "change bug ticket description", new TimeSpan(4, 3, 2), 1);
            Console.WriteLine(item.ToString());

            change.Update("Change bugs ticket description for some cases", new TimeSpan(3, 2, 1));
            Console.WriteLine(change.ToString());

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();

        }
    }
}
