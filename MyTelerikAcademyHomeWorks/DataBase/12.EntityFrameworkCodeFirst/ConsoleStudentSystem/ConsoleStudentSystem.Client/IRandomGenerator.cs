﻿using System;
namespace ConsoleStudentSystem.Client
{
    public interface IRandomGenerator
    {
        int GetRandomInteger(int min = int.MinValue, int max = int.MaxValue);

        string GetRandomString(int minLen = 5, int maxLen = 10);
    }
}
