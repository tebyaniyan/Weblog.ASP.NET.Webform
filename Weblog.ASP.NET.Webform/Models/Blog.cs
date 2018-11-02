//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Weblog.ASP.NET.Webform.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Blog
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Blog()
        {
            this.BlogComments = new HashSet<BlogComment>();
        }
    
        public int NewsID { get; set; }
        public string NewsTitle { get; set; }
        public Nullable<int> NewsGroupID { get; set; }
        public int NewsSee { get; set; }
        public System.DateTime Date { get; set; }
        public bool IsActive { get; set; }
        public string NewsImage { get; set; }
        public string Description { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BlogComment> BlogComments { get; set; }
        public virtual BlogGroup BlogGroup { get; set; }
    }
}
