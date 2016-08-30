using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using BookReSearch.Models;
using System.Data;

namespace BookReSearch
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IPatrons" in both code and config file together.
    [ServiceContract]
    public interface IPatrons
    {
        [OperationContract]
        List<PatronList> ListPatrons();
    }
}
