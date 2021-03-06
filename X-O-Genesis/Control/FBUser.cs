﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MyExtension;

namespace PetvetPOS_Inventory_System
{
    public partial class FBUser : MyUserControl
    {
        private Fallback fallback;

        public FBUser() 
        {
            InitializeComponent();
        }
        public FBUser(Fallback fallback, MasterController masterController, Panel panel) 
            : base(masterController, panel, true)
        {
            InitializeComponent();
            this.fallback = fallback;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {

        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            Validation.filterToAlphaNumeric(sender as TextBox);
        }
    }
}
