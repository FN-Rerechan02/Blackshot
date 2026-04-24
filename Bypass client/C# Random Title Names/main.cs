string str = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()/*-.";
            Random r = new Random();
            StringBuilder sb2 = new StringBuilder();
            for (int i = 1; i <= 60; i++)
            {
                int idx = r.Next(0, 35);
                sb2.Append(str.Substring(idx, 1));
            }
            this.Text = sb2.ToString();
