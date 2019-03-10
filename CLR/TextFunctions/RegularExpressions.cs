using System.Data.SqlTypes;
using System.Text.RegularExpressions;

namespace TextFunctions
{
    public class RegularExpressions
    {
        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlBoolean RegExMatch(SqlString input, SqlString pattern, SqlBoolean ignoreCase)
        {
            if (input.IsNull || pattern.IsNull)
            {
                return SqlBoolean.False;
            }

            return Regex.IsMatch(input.Value, pattern.Value,
                ignoreCase == SqlBoolean.True? RegexOptions.IgnoreCase : RegexOptions.None | RegexOptions.Singleline);
        }

        [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
        public static SqlString RegExReplace(SqlString input, SqlString pattern, SqlString replacement, SqlBoolean ignoreCase)
        {
            if (input.IsNull || pattern.IsNull)
            {
                return SqlString.Null;
            }

            return new SqlString(Regex.Replace(input.Value, pattern.Value, replacement.Value,
                ignoreCase == SqlBoolean.True? RegexOptions.IgnoreCase : RegexOptions.None | RegexOptions.Singleline));
        }
    }
}
