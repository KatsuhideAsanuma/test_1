import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;

public class SampleDraw {
    public static void main(String[] args) {
        var frame=new JFrame("drawing");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        var label=new JLabel("test");
        frame.add(label);
        var image=new BufferedImage(600,400,BufferedImage.TYPE_INT_RGB);
        label.setIcon(new ImageIcon(image));
        frame.pack();
        frame.setVisible(true);
        var g=image.createGraphics();
        g.drawLine(0,0,600,400);
        g.setColor(Color.RED);
        g.fillRect(300,200,150,100);
        g.setColor(Color.BLUE);
        g.drawLine(0,200,600,0);
        g.setColor(Color.GREEN);
        g.fillOval(0,0,100,100);
        label.repaint();


    }
}
