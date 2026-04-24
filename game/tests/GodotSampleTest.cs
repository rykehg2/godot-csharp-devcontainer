using Godot;
using GdUnit4;
using GdUnit4.Assertions;

[TestSuite]
public partial class GodotSampleTest
{
    [TestCase]
    public void Should_Pass_Godot_Interaction() => IAssertions.AssertBool(true).IsTrue();
}
