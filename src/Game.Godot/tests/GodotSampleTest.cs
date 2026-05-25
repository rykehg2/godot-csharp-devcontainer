using Godot;
using GdUnit4;

[TestSuite]
public partial class GodotSampleTest
{
    [TestCase]
    public void Should_Pass_Godot_Interaction() => Assertions.AssertBool(true).IsTrue();
}
