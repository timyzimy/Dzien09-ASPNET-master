using System;

namespace WebApplicationExample
{
    internal class City
    {
        int id;
        String name;

        public City(int id, string name)
        {
            this.id = id;
            this.name = name;
        }

        public int Id { get { return id; } }
        public string Name { get { return name; } }
    }
}