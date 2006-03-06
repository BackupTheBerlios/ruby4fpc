require "opengl"
require "glut"

$light_diffuse = [1.0, 0.0, 0.0, 0.0]
$light_position = [0.0, 0.0, 0.0, 1.0]


HEARTSHAPE = [[0,-3],[1,-2],[2,-1],[3,0],[3,1],[2,2],[1,2],[0,1],[-1,2],[-2,2],[-3,1],[-3,0],[-2,-1],[-1,-2]];

def writeILoveYou
  GL.Color(0xff,0xff,0xff)
  lmesg = "I Love You!";
  GL.PushMatrix();
    GL.Translate(0, 0, -20)
    GL::RasterPos2d(0,0)
    lmesg.each_byte { |x| GLUT.BitmapCharacter(GLUT::BITMAP_HELVETICA_18, x) }
  GL.PopMatrix();
end

$rotate=0.0

def drawHeart(scale=0.5)

  GL.Color(1.0,0.0,0.0);
  GL.PushMatrix();
  GL.Translate(0,0,-3.0);
  GL.Rotate($rotate,0,1,0);
  GL.Begin(GL::POLYGON);
    HEARTSHAPE.each() { |point|
      GL.Vertex(point[0]*scale, point[1]*scale, 0);
    }
  GL.End();
  GL.PopMatrix();
end






reshape  = Proc.new {|w, h|
   GL.Viewport(0, 0,  w,  h);
   GL.MatrixMode(GL::PROJECTION);
   GL.LoadIdentity();
   GLU.Perspective(65.0,  w / h, 1.0, 20.0);
   GL.MatrixMode(GL::MODELVIEW);
   GL.LoadIdentity();
   GL.Translate(0.0, 0.0, -5.0);
}

display = Proc.new {
   GL::Clear(GL::COLOR_BUFFER_BIT);
   GL.LoadIdentity
   drawHeart();
   writeILoveYou();
   GL.Color(1,1,1);
   GL.Begin(GL::POINTS);
    GL.Vertex(0,0,0);
   GL.End();
   GL.Flush();
   GLUT.SwapBuffers();
}

idle = Proc.new{
  if $rotate >= 360 then
    $rotate = 0
  else
    $rotate += 1;
  end
  GLUT.PostRedisplay();
  sleep(0.01);
}


  GLUT.Init
  GLUT.InitDisplayMode(GLUT::DOUBLE | GLUT::RGB | GLUT::DEPTH);
  GLUT.InitWindowSize(500, 500);
  GLUT.CreateWindow($0);

  GL.Light(GL::LIGHT0, GL::DIFFUSE, $light_diffuse);
  GL.Light(GL::LIGHT0, GL::POSITION, $light_position);
  GL.Enable(GL::LIGHT0);
  GL.Enable(GL::LIGHTING);

  GLUT.ReshapeFunc(reshape);
  GLUT.DisplayFunc(display);
  GLUT.IdleFunc(idle);
  GLUT.MainLoop